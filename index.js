var reporter = require('cucumber-html-reporter');

var options = {
    theme: 'bootstrap',
    jsonFile: 'report.json',
    output: 'cucumber_report.html',
    reportSuiteAsScenarios: true,
    scenarioTimestamp: true,
    launchReport: true,
    name: 'Flutter Latam Conf',
    brandTitle: 'Integration Test',
    metadata: {
        "Canal": "Flutter",
        "Test Environment": "QA",
        "Browser": "Chrome  54.0.2840.98",
        "Platform": "Android",
        "Parallel": "Scenarios",
        "Executed": "Remote",
        "APP": "Flutter Latam"
    }
};
reporter.generate(options);