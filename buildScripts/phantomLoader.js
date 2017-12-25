const page = require('webpage').create();

page.viewportSize = {
	width: 767,
	height: 600
};

page.paperSize = {
	format: 'A4',
	orientation: 'portrait',
	border: '1cm'
};

page.open('http://localhost:4000', function(status) {
	console.log('Status: ' + status);
	if (status === 'success') {
		page.render('resume.pdf');
		phantom.exit();
	}
});
