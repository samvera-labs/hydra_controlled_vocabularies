require 'hydra-editor'
require "hydra_controlled_vocabularies/engine"

module HydraControlledVocabularies
  class << self
    mattr_accessor :marmotta_connection
  end

  def self.config(&block)
    yield self
  end
end
