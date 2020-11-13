package com.changlu.ssm.service;

import com.changlu.ssm.domain.Product;
import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

/**
 * @anthor changlu
 * @create 2020-10-22-22:24
 */
public interface IProductService {

    List<Product> findAll() throws Exception;

    void save(Product product) throws Exception;


}