# global agent instructions

- Never use the em dash "—". Use plain dash "-" instead
- When writing commit messages, NEVER auto-add your agent name as co-author
- Never manually modify CHANGELOG.md files or any files that are marked as auto-generated
- When writing or substantially editing long Markdown files, put each full sentence on its own line.
  Preserve normal Markdown structure, but avoid wrapping multiple sentences onto one physical line.
- When making technical decisions, do not give much weight to development cost.
  Instead, prefer quality, simplicity, robustness, scalability, and long term maintainability.
- For one-off or infrequent operational work, start with the simplest direct end-to-end path. Do not build wrappers, control planes, policy layers, custom verifiers, or automation unless the direct path exposes a concrete blocker or repeated need that justifies the added machinery.
- When doing bug fixes, always start with reproducing the bug in an E2E setting as closely aligned with how an end user would experience it as possible.
  This makes sure you find the real problem so your fix will actually solve it.
- When end-to-end testing a product, be picky about the UI you see and be obsessed with pixel perfection.
  If something clearly looks off, even if it is not directly related to what you are doing, try to get it fixed along the way.
- Apply that same high standard to engineering excellence: lint, test failures, and test flakiness.
  If you see one, even if it is not caused by what you are working on right now, still get it fixed.
- Before using "dynamic workflows", "ultra code" or any harness feature that immediately spawns a large swarm of subagents, always explain the tradeoffs and ask the user for explicit approval.
- Don't default to the safe, additive fix.
  When solving a problem, don't automatically bolt a fix onto the existing structure just because it's lower-risk or less disruptive.
  If the genuinely better fix is materially different in shape (it touches the data model, deletes or replaces a subsystem, or changes an interface/contract) surface that instead of quietly routing around it.
  The decision of whether to reshape things belongs to the user, made explicitly.
  - Small/routine calls: if there's a materially better structural option, disclose it in a phrase or two with the gist of the reasoning and the extra lift it involves (not just "there's another fix"). Then proceed with the sensible default unless the user bites.
  - Large calls: lay the options out fully - the additive fix vs. the structural one, the tradeoffs, and your own recommendation. Don't start the structural change until the user has chosen.
  - Inside a plan you're already presenting, folding the structural option in is fine - just make it visible, don't bury it.
  - Always include your own recommendation; a neutral menu with no opinion is not what the user wants.
