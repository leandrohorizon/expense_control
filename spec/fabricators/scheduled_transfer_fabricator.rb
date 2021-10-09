Fabricator(:scheduled_transfer) do
  description 'salario ne pae B)'
  amount_cents 900
  occurrence_type :credit

  frequency :forever
end
