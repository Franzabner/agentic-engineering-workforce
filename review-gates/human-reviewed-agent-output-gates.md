# Human-Reviewed Agent Output Gates

Status: scaffolded
Publication state: public scaffold
Release state: not released

## Purpose

This gate set defines how AI-assisted engineering outputs are reviewed without implying an active agent workforce or autonomous production authority.

## Gate Table

| Gate | Required condition |
| --- | --- |
| Status gate | Output is labeled planned, scaffolded, public scaffold, or not released. |
| Human authority gate | Human review is upstream of publication, release, and architecture decisions. |
| Source boundary gate | No private prompts, private repo paths, private logs, private agent memory, or sealed source appear. |
| Claim gate | No deployment, production-readiness, benchmark result, proof-completion, or customer outcome claim appears. |
| Tool boundary gate | No credentials, live tool tokens, endpoints, private URLs, or tool-permission maps appear. |

## Output Disposition

- `public-safe template`: keep as scaffolded documentation.
- `rewrite required`: remove ambiguous authority or status language.
- `hold private`: depends on private workflow or source context.
- `privacy escalation`: contains sensitive operational or access detail.
