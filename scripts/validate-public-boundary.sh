#!/usr/bin/env bash
set -u

missing=0

required_files=(
  "AGENTS.md"
  "README.md"
  "STATUS.md"
  "PUBLIC_BOUNDARY.md"
  "CLAIMS.md"
  "VALIDATION.md"
  "ARTIFACT_REGISTER.md"
  "REVIEW_LOG.md"
  "requirements.txt"
  "execution-loops/README.md"
  "execution-loops/codex-style-execution-loop.md"
  "agent-roles/README.md"
  "agent-roles/specialist-agent-role-pattern.md"
  "task-lifecycle/README.md"
  "task-lifecycle/synthetic-task-lifecycle.md"
  "tool-permissions/README.md"
  "tool-permissions/tool-permission-matrix.md"
  "review-gates/README.md"
  "review-gates/human-review-gate-template.md"
  "logging-templates/README.md"
  "logging-templates/synthetic-agent-run-log-template.md"
  "refusal-rules/README.md"
  "refusal-rules/agent-refusal-rule-template.md"
  "human-approval-boundaries/README.md"
  "human-approval-boundaries/human-approval-boundary.md"
  "review-lanes/README.md"
  "review-lanes/generic-ai-review-lanes.md"
  "diagrams/README.md"
  "diagrams/agent-task-review-flow.mmd"
  "scripts/validate-public-boundary.sh"
  "templates/task-brief-template.md"
  "templates/agent-run-record-template.md"
  "templates/approval-record-template.md"
)

for file in "${required_files[@]}"; do
  if [ -f "$file" ]; then
    printf "PASS %s\n" "$file"
  else
    printf "FAIL %s\n" "$file"
    missing=$((missing + 1))
  fi
done

required_terms=(
  "planned"
  "scaffolded"
  "published"
  "released"
  "private/not-public"
  "active agent workforce"
  "autonomous production agents"
  "internal prompts"
  "private agent memory"
  "sealed agent memory"
  "live tool tokens"
  "credentials"
  "private repo paths"
  "customer data"
  "production execution logs"
  "private runtime"
  "released software"
  "validation"
  "review"
)

for term in "${required_terms[@]}"; do
  if rg -q "$term" .; then
    printf "PASS term: %s\n" "$term"
  else
    printf "FAIL term: %s\n" "$term"
    missing=$((missing + 1))
  fi
done

blocked_files="$(find . -path ./.git -prune -o \( -iname '*.key' -o -iname '*.pem' -o -iname '*.env' -o -iname '*.log' -o -iname '*.json' \) -print)"
if [ -z "$blocked_files" ]; then
  printf "PASS blocked artifact scan\n"
else
  printf "FAIL blocked artifact scan\n%s\n" "$blocked_files"
  missing=$((missing + 1))
fi

if [ "$missing" -eq 0 ]; then
  printf "Result: PASS - agentic engineering workforce public boundary scaffold is complete.\n"
else
  printf "Result: FAIL - %s required checks failed.\n" "$missing"
fi

exit "$missing"

