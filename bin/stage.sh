cd "$(dirname "$0")"
cd ..

yarn deploy

mkdir ./.svelte-kit/evictions
cp -a ./.svelte-kit/cloudflare/. ./.svelte-kit/evictions/
rm -r ../Interactives/evictions
mv ./.svelte-kit/evictions ../Interactives/

cd ../Interactives
git checkout staging
git add .
git commit -m 'updates to evictions repo'
git push origin staging