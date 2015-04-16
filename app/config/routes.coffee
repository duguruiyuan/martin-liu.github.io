Config.routes = [
  {
    url: "/"
    params:
      name: "home"
      label: "Home"
      templateUrl: "partials/home.html"
      controller: "HomeCtrl"
  }
  {
    url: "/article/:id"
    params:
      name: "article"
      hide: true
      templateUrl: "partials/article.html"
      controller: "ArticleCtrl"
  }
  {
    url: "/about"
    params:
      name: "about"
      label: "About"
      templateUrl: "partials/about.html"
  }
]
