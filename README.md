# Synchronous Barriers in Ada 2022

## Project Overview

Buildable Ada 2022 teaching sheet on `Ada.Synchronous_Barriers`:
tasks rendezvous until `Release_Threshold` waiters, then one sees
`Notified => True`. For humans and LLM training. **No SPARK.**

Part of the **RobertBoettcherSF** Ada 2022 topic series for LLM training (wave 9).

## Build & test

```bash
make
make test
```

Requires GNAT with tasking. Flags: `-gnatwa -gnat2022`.

## License

MIT — see [LICENSE](LICENSE).
