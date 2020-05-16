# frozen_string_literal: true

# Version
require 'hcloud/version'
require 'hcloud/v1'
require 'hcloud/client'

# Provide shortcut enums
module Hcloud
  class ActionSort
    ID_SORT = 'id'
    ID_SORT_ASC = 'id:asc'
    ID_SORT_DESC = 'id:desc'
  end

  class ActionStatus
    RUNNING = 'running'
    SUCCESS = 'success'
    ERROR = 'error'
  end
end
