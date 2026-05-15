# Validation

Run:

```bash
test -f README.md
test -f PUBLIC_BOUNDARY.md
test -f scripts/validate-public-boundary.sh
bash scripts/validate-public-boundary.sh
rg -n "planned|scaffolded|published|released|private/not-public|active agent workforce|autonomous production agents|internal prompts|private agent memory|sealed agent memory|live tool tokens|credentials|private repo paths|customer data|production execution logs|private runtime|released software|validation|review" .
git diff --check
git status --short
git remote -v
```

