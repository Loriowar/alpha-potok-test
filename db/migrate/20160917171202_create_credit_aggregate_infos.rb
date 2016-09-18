class CreateCreditAggregateInfos < ActiveRecord::Migration[5.0]
  def up
    execute <<-SQL
      CREATE VIEW credit_aggregate_infos AS
          SELECT c.id AS credit_id,
                 u.id AS user_id,
                 c.amount AS returned_base,
                 (SUM(cp.amount) - c.amount) AS returned_percentage,
                 c.annual_rate_base AS annual_rate_base,
                 c.annual_rate_delay AS annual_rate_delay,
                 ((SUM(cp.amount) - c.amount)/c.amount*12/c.duration) AS annual_rate_real
          FROM users AS u
          INNER JOIN credits AS c ON c.user_id = u.id
          INNER JOIN credit_payments AS cp ON cp.credit_id = c.id
          GROUP BY c.id, u.id
          HAVING c.duration = COUNT(cp.id);
    SQL
  end

  def down
    execute <<-SQL
      DROP VIEW credit_aggregate_infos;
    SQL
  end
end
