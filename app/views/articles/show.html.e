<div> <%= @article.title %>
</div>
<div> <%= image_tag(@article.picture) %>
</div>
<div> <%= @article.text_body %>
</div>
<div>作者
  <a href= "/business_cards/"> 李俊锋</a>
  <-- 点击蓝字，轻松关注
</div>

<!-- JiaThis Button BEGIN -->
<div id="ckepop">
<span class="jiathis_txt">分享到：</span>
<a class="jiathis_button_qzone">QQ空间</a>
<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js" charset="utf-8"></script>
<!-- JiaThis Button END -->