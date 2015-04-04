/* To avoid CSS expressions while still supporting IE 7 and IE 6, use this script */
/* The script tag referencing this file must be placed before the ending body tag. */

/* Use conditional comments in order to target IE 7 and older:
	<!--[if lt IE 8]><!-->
	<script src="ie7/ie7.js"></script>
	<!--<![endif]-->
*/

(function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
		'icon-plane': '&#xf072;',
		'icon-credit-card': '&#xf09d;',
		'icon-visa': '&#xf0ac;',
		'icon-money': '&#xf0d6;',
		'icon-health-insurance': '&#xf0f0;',
		'icon-moving': '&#xf0f2;',
		'icon-medkit': '&#xf0fa;',
		'icon-file-text': '&#xf15c;',
		'icon-bank': '&#xf19c;',
		'icon-institution': '&#xf19c;',
		'icon-university': '&#xf19c;',
		'icon-bed': '&#xf236;',
		'icon-hotel': '&#xf236;',
		'icon-public-transport': '&#xf239;',
		'icon-housing': '&#xe600;',
		'icon-telecommunication': '&#xe601;',
		'icon-residence-permit': '&#xe603;',
		'icon-wallet': '&#xe604;',
		'icon-housing-benefit': '&#xe605;',
		'icon-forum-icon': '&#x6a;',
		'icon-help-icon': '&#x69;',
		'icon-library-icon': '&#x68;',
		'icon-roadmap-icon': '&#x67;',
		'icon-search-icon': '&#x66;',
		'icon-settings-icon': '&#x65;',
		'icon-settlebuddy-icon': '&#x64;',
		'icon-getgo_text': '&#x61;',
		'icon-getgo_logo': '&#x62;',
		'icon-getgo_symbol': '&#x63;',
		'0': 0
		},
		els = document.getElementsByTagName('*'),
		i, c, el;
	for (i = 0; ; i += 1) {
		el = els[i];
		if(!el) {
			break;
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
}());
