#!/usr/bin/env bash
# Checks that each add-on's files agree with its config.yaml:
#   - the top CHANGELOG.md entry is for the current version
#   - a Dockerfile that pulls the upstream image Renovate tracks uses the
#     same tag as config.yaml's version
# Pass --skip-changelog to skip the first check.
set -euo pipefail

skip_changelog=false
[[ "${1:-}" == "--skip-changelog" ]] && skip_changelog=true

status=0
fail() {
  echo "::error file=$1::$2"
  status=1
}

for config in */config.yaml; do
  dir=$(dirname "${config}")
  slug=$(sed -n 's/^slug: *"\{0,1\}\([^"]*\)"\{0,1\} *$/\1/p' "${config}")
  version=$(sed -n 's/^version: *"\{0,1\}\([^"]*\)"\{0,1\} *$/\1/p' "${config}")
  echo "${dir}: slug=${slug} version=${version}"

  if [[ "${skip_changelog}" == false ]]; then
    changelog="${dir}/CHANGELOG.md"
    top=$(grep -m1 '^## ' "${changelog}" || true)
    if [[ "${top}" != "## ${slug} ${version} - "* ]]; then
      fail "${changelog}" "Top entry is '${top}', expected '## ${slug} ${version} - <date>'"
    fi
  fi

  dockerfile="${dir}/Dockerfile"
  image=$(sed -n 's/^# renovate: datasource=docker depName=\(.*\)$/\1/p' "${config}")
  if [[ -f "${dockerfile}" && -n "${image}" ]]; then
    tag=$(sed -n "s|^FROM ${image}:\([^ @]*\).*|\1|p" "${dockerfile}")
    if [[ -n "${tag}" && "${tag#v}" != "${version}" ]]; then
      fail "${dockerfile}" "FROM ${image}:${tag} does not match config.yaml version ${version}"
    fi
  fi
done

exit "${status}"
