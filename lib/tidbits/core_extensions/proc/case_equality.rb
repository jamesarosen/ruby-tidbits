module Tidbits
  module CoreExtensions
    module Proc 
      module CaseEquality
        
        def ===(*args)
          !!call(*args)
        end
        
      end
    end
  end
end

::Proc.send :include, Tidbits::CoreExtensions::Proc::CaseEquality