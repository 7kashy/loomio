BaseRecordsInterface = require 'shared/record_store/base_records_interface.coffee'
AnnouncementModel    = require 'shared/models/announcement_model.coffee'

module.exports = class AnnouncementRecordsInterface extends BaseRecordsInterface
  model: AnnouncementModel

  fetchNotified: (fragment) ->
    @fetch
      path: 'notified'
      params:
        q: fragment
        per: 5

  fetchNotifiedDefault: (model, kind) ->
    @fetch
      path: 'notified_default'
      params:
        kind: kind
        "#{model.constructor.singular}_id": model.id

  buildFromModel: (model, kind) ->
    @build
      kind: kind
      announceableId:   model.id
      announceableType: _.capitalize model.constructor.singular
