class UpdateGo < ApiUpdater
  def updater
    Genome::OnlineUpdaters::Go::Updater.new()
  end

  def next_update_time
    Date.today
      .beginning_of_week
      .next_month
      .midnight
  end

  def should_group_genes?
    true
  end

  def should_group_drugs?
    false
  end

  def should_cleanup_gene_claims?
    false
  end
end
