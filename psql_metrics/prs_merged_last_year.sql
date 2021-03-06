select
  e.repo_name as repo_name,
  count(pr.id) as merge_count
from
  gha_pull_requests pr,
  gha_events e
where
  pr.event_id = e.id
  and pr.merged_at >= 'now'::timestamp - '1 year'::interval
group by
  repo_name
order by
  merge_count desc
