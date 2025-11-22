#!/bin/bash
set -e

# --- 1. Ensure Node dependencies are installed ---
echo "1. Installing Node dependencies..."
# This step is often necessary in CI/CD pipelines to ensure 'hugo' and 'wrangler' are available
npm install

# --- 2. Running Hugo Build ---
echo "2. Running Hugo Build..."
hugo --gc

# --- 3. Running deployment via the correct Wrangler command for Workers ---
# We use 'wrangler deploy' which is the standard command for Workers, and Cloudflare
# automatically handles uploading static assets found in the 'public' directory
# if the project is configured as a static worker site.
echo "3. Running deployment via Wrangler..."
npx wrangler deploy --minify

echo "4. Deployment command finished."
