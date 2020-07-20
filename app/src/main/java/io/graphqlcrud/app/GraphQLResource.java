/*
 * Copyright 2012-2017 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.graphqlcrud.app;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.eclipse.microprofile.config.inject.ConfigProperty;

import graphql.ExecutionInput;
import graphql.ExecutionResult;
import graphql.GraphQL;
import graphql.schema.GraphQLSchema;
import graphql.schema.idl.SchemaPrinter;
import io.agroal.api.AgroalDataSource;
import io.graphqlcrud.DatabaseSchemaBuilder;
import io.graphqlcrud.GraphQLSchemaBuilder;

@Path("/graphql")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class GraphQLResource {
    
    @Inject
    private AgroalDataSource datasource;
    
    private GraphQLSchema schema;
    
    @ConfigProperty(name = "quarkus.datasource.schema")
    private String dbSchemaName;
    
    @POST
    public Map<String, Object> graphql(String query) throws Exception {
        GraphQLSchema schema = buildSchema();
        SchemaPrinter sp = new SchemaPrinter();
        System.out.println(sp.print(schema));
        
        QueryParameters qp = QueryParameters.from(query);
        
        ExecutionInput.Builder executionInput = ExecutionInput.newExecutionInput()
                .query(qp.getQuery())
                .operationName(qp.getOperationName())
                .variables(qp.getVariables());
        
        // pass the datasource around
        executionInput.context(new Context(this.datasource));
        
        GraphQL graphQL = GraphQL
                .newGraphQL(schema)
                //.instrumentation(instrumentation)
                .build();
        
        ExecutionResult executionResult = graphQL.execute(executionInput.build());
        return executionResult.toSpecification();
    }
    
    private GraphQLSchema buildSchema() throws SQLException {
        if (this.schema == null) {
            try(Connection conn = this.datasource.getConnection()){
                GraphQLSchemaBuilder builder = new GraphQLSchemaBuilder();
                this.schema = builder.getSchema(DatabaseSchemaBuilder.getSchema(conn, this.dbSchemaName)); 
            }
        }
        return this.schema;
    }    
}