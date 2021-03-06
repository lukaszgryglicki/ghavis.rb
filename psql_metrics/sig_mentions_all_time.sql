select 
  substring(sig from 13) as sig, 
  count(*) as count_all_time
from 
  (
    select 
      substring(
        body from '(@kubernetes/sig-[\w-]+)(-bugs|-feature-request|-pr-review|-api-review|-misc|-proposal|-design-proposal|-test-failure)s?\s+'
      ) as sig 
    from 
      gha_texts
  ) sel 
where
  sel.sig is not null
group by 
  sel.sig
order by
  count_all_time desc,
  sel.sig asc
