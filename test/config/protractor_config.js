const path = require('path');
const yargs = require('yargs').argv;
const reporter = require('cucumber-html-reporter');

const reportOptions = {
  theme: 'bootstrap',
  jsonFile: path.join(__dirname, '../reports/report.json'),
  output: path.join(__dirname, '../reports/cucumber-reporter.html'),
  reportSuitsAsScenarios: true
};

exports.config = {
  allScriptsTimeout: 60000,
  getPageTimeout: 60000,
  specs: [path.resolve('./test/features/**/*.feature')],
  framework: 'custom',
  frameworkPath: require.resolve('protractor-cucumber-framework'),
  capabilities: {
    shardTestFiles: yargs.instances > 1,
    maxInstances: yargs.instances || 1,
    browserName: 'chrome',
    chromeOptions: {
      args: ['--no-sandbox', '--window-size=1920,1080']
    },
  },
  disableChecks: true,
  directConnect: true,
  cucumberOpts: {
    require: ['../step_definitions/**/*.js'],
    ignoreUncaughtExceptions: true,
    format: ['json:../reports/report.json', '../../node_modules/cucumber-pretty'],
    tags: yargs.tags || '@smoke'
  },
  onPrepare: () => {
    return browser.waitForAngularEnabled(false);
  },
  afterLaunch: () => {
    return reporter.generate(reportOptions)
  }
};