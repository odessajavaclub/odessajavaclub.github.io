## To create a new post:

1. Create a new file in `_posts` folder: `YYYY-MM-DD-event-##-title.md`
2. The template of the post:
```
---
layout: post
title:  "Event#__ Title"
image: /assets/images/post.png
date:   YYYY-MM-DD HH:MM:SS +0200
tags: [tag1, tag2]
---
This week on Java club we will take a look at TITLE.

Join us on Wednesday, at 12:00 in Long Island (Room 805)
```

An example:
```
---
layout: post
title:  "Event#26 Hexagonal Architecture"
image: /assets/images/post.png
date:   2019-10-30 12:00:00 +0200
tags: [hexagonal, video]
---
This week on Java club we will take a look at Hexagonal Architecture.

Join us on Wednesday, at 12:00 in Long Island (Room 805)
```

## Useful scripts (require Docker installed)

### Run site locally

```
scripts/run-local.sh
```

The site is available at `localhost:4000`.
As you make changes to your blog, they will automatically be picked up the Jekyll process running in a docker container.

### Build site

```
scripts/build.sh
```

### Update dependencies

```
scripts/update-deps.sh
```

This will update `Gemfile.lock` using the provided `Gemfile`.
Dependency versions used by `github-pages` gem is provided [here](https://pages.github.com/versions/).