COPY (
    SELECT hsi.relation_id
         , s.sentence_id
         , description
         , is_true
         , expectation
         , s.words
         , p1.start_position AS p1_start
         , p1.length AS p1_length
         , p2.start_position AS p2_start
         , p2.length AS p2_length
         , p2.length AS p2_length
      FROM has_spouse_is_true_inference hsi
         , sentences s
         , people_mentions p1
         , people_mentions p2
     WHERE s.sentence_id = hsi.sentence_id
       AND p1.mention_id = hsi.person1_id
       AND p2.mention_id = hsi.person2_id
       AND expectation   > 0.9
  ORDER BY random() LIMIT 100
) TO STDOUT WITH CSV HEADER;
