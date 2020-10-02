module CodaHelper
  SEARCH_INCLUDE_OPTIONS = [
    ['', 'Everything'],
    %w[sent Sent],
    %w[received Received]
  ].freeze

  def coda_validators_active_filter(validators)
    validators.count(&:active?) > 0 ? '_active_' : '_inactive_'
  end

  def coda_tx_icon(tx, public_key)
    dir = tx.receiver == public_key ? 'down' : 'up'
    content_tag(:i, class: "fa fa-caret-#{dir} tx-dir #{dir}") { '' }
  end

  def coda_tx_include_opts
    SEARCH_INCLUDE_OPTIONS
  end

  def coda_validator_power(balance, total)
    number_to_percentage(total > 0 ? (balance * 100.0 / total).round(2) : 0)
  end

  def coda_block_heatmap_title(block, account)
    span_arrow = content_tag(:span, '', class: 'fas fa-arrow-right text-sm text-muted mx-2')

    span_badge = content_tag(:span, class: 'badge badge-success') do
      block.producer?(account) ? 'PRODUCER' : 'OK'
    end

    "Block #{block.height} #{span_arrow} #{span_badge}".html_safe
  end

  def coda_delegation_share(value, total)
    return '-' unless total && total > 0

    number_to_percentage((value * 100.0) / total)
  end
end