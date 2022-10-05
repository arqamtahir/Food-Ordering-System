import { Application } from "stimulus"
const application = Application.start()
import { definitionsFromContext } from "stimulus/webpack-helpers"
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context))
const controllers = require.context('.', true, /.coffee$/)
controllers.keys().forEach(controllers)
