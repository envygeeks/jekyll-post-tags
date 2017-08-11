<p align=center>
  <a href=https://goo.gl/BhrgjW>
    <img src=https://envygeeks.io/badges/paypal-large_1.png alt=Donate>
  </a>
  <br>
  <a href=https://travis-ci.org/envygeeks/jekyll-post-tags>
    <img src="https://travis-ci.org/envygeeks/jekyll-post-tags.svg?branch=master">
  </a>
</div>

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
