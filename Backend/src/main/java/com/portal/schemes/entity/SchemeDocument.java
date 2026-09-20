package com.portal.schemes.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "scheme_documents")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SchemeDocument {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "doc_id")
    private Integer docId;

    @Column(name = "scheme_id", nullable = false)
    private Integer schemeId;

    @Column(name = "document_name", length = 150)
    private String documentName;
}