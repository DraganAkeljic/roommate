<div ng-controller="CheckAdController">
	<div class="col-sm-12 col-md-6">
		<div class="img">
			<figure>
				<div class="rent"></div>
				<img ng-src="{{img}}"/>
				<figcaption>
					<a href="{{AdUrl}}"></a>
				</figcaption>
			</figure>
		</div>
		<ul class="about">
			<li class="location"><a href="{{AdUrl}}">Check this ad</a></li>
			<li class="short">{{type}}</li>
			<li class="short">{{available}}</li>
		</ul>
	</div>
</div>