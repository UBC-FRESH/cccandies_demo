# cccandies-demo

Currently set up assuming you have the following Google environment variables set (e.g., in `.Renviron`).

```
GARGLE_CLIENT_ID="CLIENT_ID.apps.googleusercontent.com"
GARGLE_CLIENT_SECRET="CLIENT_SECRET"
```

You also need to initialize git submodules, and download data from the Arbutus S3 bucket using DataLad.

```bash
git submodule update --init --recurive
datalad get input -r
```
