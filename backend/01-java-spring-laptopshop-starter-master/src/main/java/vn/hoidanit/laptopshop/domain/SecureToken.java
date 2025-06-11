package vn.hoidanit.laptopshop.domain;

import java.time.LocalDateTime;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "secureToken")
public class SecureToken {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    @Column(unique=true)
    private String token;
    @Column(updatable = false)
    @Basic(optional = false)
    private LocalDateTime expireAt;
    @JoinColumn(name = "user_id", referencedColumnName = "user")
    private User user;
}
