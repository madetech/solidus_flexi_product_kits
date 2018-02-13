module SolidusFlexiProductKits
  module VariantDecorator
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many  :assemblies, :class_name => "Spree::Product",
            :join_table => "spree_assemblies_parts",
            :foreign_key => "part_id", :association_foreign_key => "assembly_id"
    end

    def assemblies_for(products)
      assemblies.where(id: products)
    end

    def part?
      assemblies.exists?
    end
  end
end

Spree::Variant.include(SolidusFlexiProductKits::VariantDecorator)
