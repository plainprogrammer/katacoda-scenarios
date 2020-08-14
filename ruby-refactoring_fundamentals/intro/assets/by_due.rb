def by_due(tasks)
  result = []

  result = tasks.sort_by do |task|
    task.due
  end

  result
end