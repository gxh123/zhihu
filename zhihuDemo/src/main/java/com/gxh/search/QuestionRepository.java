package com.gxh.search;

import com.gxh.model.Question;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;

public interface QuestionRepository extends ElasticsearchRepository<Question, Long> {

    public List<Question> findTop10ByTitle(String title,Pageable pageable);

}
