# My Blog
## Front end
Build by [m-angular-boilerplate](https://github.com/martin-liu/m-angular-boilerplate)

Using [github API](https://developer.github.com/v3/) to interact with back end

## Back end
Using [github issues](https://github.com/martin-liu/martin-liu.github.io/issues) as backend CMS


## Make it work for you
1. Fork this repo, you can rename it as you like. If named as `YOUR_GITHUB_NAME.github.io`, Github will use `master` branch to generate static page, otherwise it will use `gh-pages` branch.
2. Update `githubRepo` attribute in [`app/config/config.coffee.prod`](https://github.com/martin-liu/martin-liu.github.io/blob/staging/app/config/config.coffee.prod#L10). The example below will go get issues from repo `github.com/xxx/yyy`
 ```
githubRepo:
    name: "yyy"
    owner: "xxx"
```

3. update [`duoshuo`](https://github.com/martin-liu/martin-liu.github.io/blob/staging/app/index.html#L121)和[`baidu statistics`](https://github.com/martin-liu/martin-liu.github.io/blob/staging/app/index.html#L131), you need to register accounts of them, or you can just disable them by remove the JS references and code.

4. run `bin/deploy.sh`. This will build and push to `master` branch by default, you can also update the file to make it push to `gh-pages`
