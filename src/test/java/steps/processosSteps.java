package steps;

import cucumber.api.PendingException;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Então;
import groovy.json.internal.LazyMap;
import cucumber.api.java.pt.Quando;
import definition.Processos;
import org.junit.Assert;
import support.RESTSupport;

public class processosSteps {
    @Dado("^que o usuário está na home de processos$")
    public void que_o_usuário_está_na_home_de_processos() throws Throwable {
        Processos.clearFields();
    }

    @Dado("^preenche o campo \"([^\"]*)\" com o valor \"([^\"]*)\"$")
    public void preenche_o_campo_com_o_valor(String campo, String valor) throws Throwable {
        Processos.addFields(campo,valor);
    }

    @Quando("^clicar em salvar$")
    public void clicar_em_salvar() throws Throwable {
        RESTSupport.executePost(Processos.getEndPoint(),Processos.getFields());
        Processos.setLastID(RESTSupport.key("id").toString());
    }

    @Então("^deve receber a mensagem de \"([^\"]*)\"$")
    public void deve_receber_a_mensagem_de(String tipo) throws Throwable {
        LazyMap messageJson = new LazyMap();

        messageJson.put("salvo com sucesso", 201);
        messageJson.put("sucesso", 200);
        messageJson.put("sem informação", 204);
        messageJson.put("não encontrado", 404);
        messageJson.put("não autorizado", 401);
        messageJson.put("entidade não processável", 422);

        Assert.assertEquals(messageJson.get(tipo),RESTSupport.getResponseCode());
    }

    @Então("^dever ver o campo \"([^\"]*)\" com valor \"([^\"]*)\"$")
    public void dever_ver_o_campo_com_valor(String campo, String valor) throws Throwable {
        Assert.assertEquals(valor, RESTSupport.key(campo));
    }

    @Dado("^consulta o processo com id \"([^\"]*)\"$")
    public void consulta_o_processo_com_id(String id) throws Throwable {
        Processos.setLastID(id);
    }

    @Quando("^clicar em visualizar$")
    public void clicar_em_visualizar() throws Throwable {
        RESTSupport.executeGet(Processos.getEndPoint() + Processos.getLastID() + ".json");
    }

    @Quando("^clicar em atualizar$")
    public void clicar_em_atualizar() throws Throwable {
        RESTSupport.executePut(Processos.getEndPoint() +
                Processos.getLastID() + ".json", Processos.getFields());
    }

    @Quando("^clicar em deletar$")
    public void clicarEmDeletar() {
        RESTSupport.executeDelete(Processos.getEndPoint() + Processos.getLastID() + ".json");
    }

}
