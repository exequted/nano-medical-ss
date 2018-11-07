package dao;

import entity.Client;
import entity.Client.ClientBuilder;
import org.apache.logging.log4j.Logger;
import utility.SqlQueryUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.UUID;

import static org.apache.logging.log4j.LogManager.getLogger;
import static utility.ClassNameUtil.getClassName;
import static utility.SqlQueryUtil.getQuery;

public class ClientDao {

    private Dao dao;
    private Connection connection;

    private static final Logger LOGGER = getLogger(getClassName());

    public ClientDao(Dao dao){
        this.dao = dao;
        this.connection = dao.getConnection();
    }

    public void save(Client client){
        if (client.getId() != null){ update(client); return; }
        LOGGER.trace("Started saving client {} in database.", client);
        try {
            PreparedStatement statement = connection.prepareStatement(getQuery("client.insert"));
            statement.setString(1, client.getFullName());
            statement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.warn("Client {} wasn't saved to database", client, e);
        }
        LOGGER.trace("Client {} saved successfully.", client);
    }

    public void update(Client client){
        if (client.getId() == null){ save(client); return; }
        LOGGER.trace("Started updating client {} in database.", client);
        try {
            PreparedStatement statement = connection.prepareStatement(getQuery("client.update"));
            statement.setString(1, client.getFullName());
            statement.setObject(2, client.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.warn("Client {} wasn't updated in database", client, e);
        }
        LOGGER.trace("Client {} updated successfully.", client);
    }

    public Client getById(UUID id){
        Client client = null;
        LOGGER.trace("Started getting client by id {} from database.", id);
        try {
            PreparedStatement statement = connection.prepareStatement(getQuery("client.select"));
            statement.setObject(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.first()){
                client = new ClientBuilder().setId(id)
                                            .setFullName(resultSet.getString("full_name"))
                                            .build();
            }
        } catch (SQLException e) {
            LOGGER.warn("Client wiht id {} wasn't found in database", id, e);
        }
        LOGGER.trace("Client with id {} was get successfully.", id);
        return client;
    }

    public HashSet<Client> getAll(){
        HashSet<Client> clients = new HashSet<>();
        LOGGER.trace("Started getting all clients from database.");
        try {
            ResultSet resultSet = connection.createStatement().executeQuery(getQuery("client.selectAll"));
            while(resultSet.next()){
                clients.add(new ClientBuilder().setId((UUID) resultSet.getObject("id"))
                                               .setFullName(resultSet.getString("full_name"))
                                               .build());
            }
        } catch (SQLException e) {
            LOGGER.warn("Process of getting all clients crashed.", e);
        }
        LOGGER.trace("All clients get successfully");
        return clients;
    }

    public void deleteById(UUID id){
        LOGGER.trace("Started deleting client with id {} from database.", id);
        try {
            int status = connection.createStatement().executeUpdate(getQuery("client.delete"));
            if (status == 0) LOGGER.info("No clients were affected while deleting");
        } catch (SQLException e) {
            LOGGER.warn("Process of deleting client crashed.", e);
        }
        LOGGER.debug("Client with id {} deleted successfully", id);
    }
}
