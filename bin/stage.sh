cd "$(dirname "$0")"
cd ..

yarn deploy

mkdir ./.svelte-kit/evictions
cp -a ./.svelte-kit/cloudflare/. ./.svelte-kit/evictions/