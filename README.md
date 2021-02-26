[![MIT License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://tldrlegal.com/license/mit-license) [![Release Status](https://github.com/quan-to/agent-ui/workflows/AgentUI%20Release/badge.svg)](https://github.com/quan-to/agent-ui/actions) [![Test Status](https://github.com/quan-to/agent-ui/workflows/AgentUI%20Tests/badge.svg)](https://github.com/quan-to/agent-ui/actions)
# Agent UI
GPG Signed GraphQL Client for Quanto


Agent UI Development
====================

The graphql-playground fork for AgentUI is hosted at [https://github.com/quan-to/graphql-playground](https://github.com/quan-to/graphql-playground)

Top update agent-ui playground:

1. Clone Repository https://github.com/quan-to/graphql-playground
2. Change to branch `chevron`
3. `yarn`
4. Edit the package `packages/graphql-playground-react`
5. `yarn build`
6. Copy `build/*` to `cmd/agent-ui/resources/app/`
7. Change `/static/` to `./static/` in `cmd/agent-ui/resources/app/index.html`
8. Run `astilectron-bundler` in `cmd/agent-ui`
