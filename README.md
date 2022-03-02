# Apollo Router Example Dockerfile Image

These are the instructions for how you can build an image.  Overall, after building this image (which shouldn't necessitate any changes), it should be possibly to merely set the correct environment variables and run with it:

## Building this image

```
docker build . -t your-tag-name:latest
```

## Running this image

1. Open the `env.list` file and set the `APOLLO_KEY` and `APOLLO_GRAPH_REF` environment variables.
2. Run it - by default it exposes port 4000:

   ```
   docker run --rm -it -p 4000 --env-file=./env.list your-tag-name:latest
   ```