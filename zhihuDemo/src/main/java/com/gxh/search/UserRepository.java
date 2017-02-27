package com.gxh.search;

import com.gxh.model.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;

public interface UserRepository extends ElasticsearchRepository<User, Long> {

    public List<User> findTop3ByName(String name, Pageable pageable);

}
