[![Code Climate](https://img.shields.io/codeclimate/maintainability/envygeeks/jekyll-post-tags.svg?style=for-the-badge)](https://codeclimate.com/github/envygeeks/jekyll-post-tags/maintainability)
[![Code Climate](https://img.shields.io/codeclimate/c/envygeeks/jekyll-post-tags.svg?style=for-the-badge)](https://codeclimate.com/github/envygeeks/jekyll-post-tags/coverage)
[![Travis CI](https://img.shields.io/travis/envygeeks/jekyll-post-tags/master.svg?style=for-the-badge)](https://travis-ci.org/envygeeks/jekyll-post-tags)
[![Donate](https://img.shields.io/badge/-DONATE-yellow.svg?style=for-the-badge)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=LKGZAWXLZ8ZPG)
![Gem Version](https://img.shields.io/gem/v/jekyll-post-tags.svg?style=for-the-badge)
![Gem DL](https://img.shields.io/gem/dt/jekyll-post-tags.svg?style=for-the-badge)

# Jekyll Post Tags

Jekyll post tags turns your Jekyll tags into drops without disrupting the way that Jekyll flows... or the way that you work with Jekyll's own tagging system.  It also acts as a generator for tag pages, with custom templates (no defaults,) and custom pathing.  It is different than other tagging platforms in that it works within what Jekyll already does and might not require you to change your code that much (if at all in some cases.)

## Usage
#### From Within Your Templates
##### All Tags
```html
<ul class="tags">
  {% for tag in site.tags %}
  <li class="weight-{{ tag[0].weight | round }}">
    <a title="Site Tag: {{ tag[0] }}" href="{{ tag[0].url | pretty }}">
      {{ tag[0] }}
    </a>
  </li>
  {% endfor %}
</ul>
```

##### Post Tags
```html
<ul class="tags">
  {% for tag in post.tags %}
  <li class="weight-{{ tag.weight | round }}">
    <a title="Site Tag: {{ tag }}" href="{{ tag.url | pretty }}">
      {{ tag }}
    </a>
  </li>
  {% endfor %}
</ul>
```
