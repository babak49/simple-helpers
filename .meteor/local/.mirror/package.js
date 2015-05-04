Package.describe({
  name: 'babak:simple-helpers',
  version: '1.0.0',
  summary: 'Simple helpers for your html or jade templates',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('0.9.0');

  api.use([
    'coffeescript',
    'templating',
    'momentjs:moment'
  ], 'client');

  api.addFiles([
    'client/_helpers.coffee'
  ], 'client');
});

Package.onTest(function(api) {
  api.use([
    'coffeescript',
    'mike:mocha'
  ]);
  api.use('babak:simple-helpers');

  api.addFiles([
    'tests/mocha/client/testHelpers.coffee'
  ], 'client');
});
