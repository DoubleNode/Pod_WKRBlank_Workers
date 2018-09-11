Steps to Update Pod
-------------------
0. For New Install Only:
pod repo add PostablurSpecs https://github.com/postablur/SpecsPrivateRepo.git
pod repo update PostablurSpecs

1. Check local files
pod lib lint --sources=git@github.com:postablur/SpecsPrivateRepo.git,master --private --allow-warnings

2. Create tag and push to github

3. Check repo file
pod spec lint --sources=git@github.com:postablur/SpecsPrivateRepo.git,master --private --allow-warnings

4. Final Submit
pod repo push PostablurSpecs WKRBlank_Workers.podspec --allow-warnings


Steps to Resource Podfile Pods
------------------------------
When changing pod's "path" to/from development mode:

rm Pods/Manifest.lock && rm Podfile.lock && pod install
