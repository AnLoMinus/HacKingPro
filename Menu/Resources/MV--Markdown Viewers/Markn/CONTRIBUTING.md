# Contributing

## Environment

```bash
npm install
```

## Debugging

```bash
npm run debug
```

## Release to github releases (Only Owner or Collaborator)

requires github oauth `TOKEN`.

1. Install wine with `brew install wine`.
2. Then:

- major release: `TOKEN=xxxxxxxxxxxx gulp publish -r major`
- minor release: `TOKEN=xxxxxxxxxxxx gulp publish -r minor`
- patch release: `TOKEN=xxxxxxxxxxxx gulp publish -r patch` or just `token=xxxxxxxxxxxx gulp publish`

## Publish to npm (Only Owner)

```bash
npm run publish
```
