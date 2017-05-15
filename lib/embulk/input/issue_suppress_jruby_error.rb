module Embulk
  module Input

    class IssueSuppressJrubyError < InputPlugin
      Plugin.register_input("issue_suppress_jruby_error", self)

      def self.transaction(config, &control)
        # configuration code:
        task = {
          "option1" => config.param("option1", :integer),                     # integer, required
          "option2" => config.param("option2", :string, default: "myvalue"),  # string, optional
          "option3" => config.param("option3", :string, default: nil),        # string, optional
        }

        columns = [
          Column.new(0, "example", :string),
          Column.new(1, "column", :long),
          Column.new(2, "value", :double),
        ]

        resume(task, columns, 1, &control)
      end

      def self.resume(task, columns, count, &control)
        task_reports = yield(task, columns, count)

        next_config_diff = {}
        return next_config_diff
      end

      # TODO
      #def self.guess(config)
      #  sample_records = [
      #    {"example"=>"a", "column"=>1, "value"=>0.1},
      #    {"example"=>"a", "column"=>2, "value"=>0.2},
      #  ]
      #  columns = Guess::SchemaGuess.from_hash_records(sample_records)
      #  return {"columns" => columns}
      #end

      def init
        # initialization code:
        @option1 = task["option1"]
        @option2 = task["option2"]
        @option3 = task["option3"]
      end

      def run
        page_builder.add(["example-value", 1, 0.1])
        page_builder.add(["example-value", 2, 0.2])
        page_builder.finish

        begin
          err
        rescue => e
          ::Embulk.logger.error "e: {class:#{e.class},msg:#{e}}"
          ::Embulk.logger.error "e.cause: {class:#{e.cause.class},msg:#{e.cause}}"
          ::Embulk.logger.error "e.cause.cause: {class:#{e.cause.cause.class},msg:#{e.cause.cause}}"
          ::Embulk.logger.error "e.cause.cause.cause: {class:#{e.cause.cause.cause.class},msg:#{e.cause.cause.cause}}"
        end

        task_report = {}
        return task_report
      end

      ### Exception code
      class Error < ::Embulk::DataError
      end

      class Error1 < ::StandardError; end
      class Error2 < ::StandardError; end
      class Error3 < ::StandardError; end
      
      def err1
        raise Error1, "err"
      end
      
      def err2
        begin
          err1
        rescue Error1 => e
          raise Error2, e
        end
      end
      
      def err3
        begin
          err2
        rescue Error2 => e
          raise Error3, e
        end
      end

      def err
        begin
          err3
        rescue => e
          # Avoid `TypeError,msg:exception class/object expected`
          # raise Error, e
          raise Error.new(e)
        end
      end
    end

  end
end
