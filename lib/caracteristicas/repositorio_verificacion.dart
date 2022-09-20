import 'package:tallerex1/dominio/nick_formado.dart';
import 'package:tallerex1/dominio/registro_usuario.dart';
import 'package:xml/xml.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tallerex1/dominio/problemas.dart';

abstract class RepositorioVerificacion {
  Either<Problema, RegistroUsuario> obtenerRegistroUsuario(NickFormado nick);
}

class RepositorioPruebasVerificacion extends RepositorioVerificacion {
  final String _benthor =
      """<?xml version="1.0" encoding="utf-8"?><user id="597373" name="benthor" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
										<firstname value="Benthor" />			<lastname value="Benthor" />			<avatarlink value="N/A" />			<yearregistered value="2012" />			<lastlogin value="2022-05-31" />			<stateorprovince value="" />			<country value="" />			<webaddress value="" />			<xboxaccount value="" />			<wiiaccount value="" />			<psnaccount value="" />			<battlenetaccount value="" />			<steamaccount value="" />			<traderating value="0" />	
				</user>""";
  final String _amlo =
      """<?xml version="1.0" encoding="utf-8"?><user id="123" name="" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
										<firstname value="" />			<lastname value="" />			<avatarlink value="N/A" />			<yearregistered value="" />			<lastlogin value="" />			<stateorprovince value="" />			<country value="" />			<webaddress value="" />			<xboxaccount value="" />			<wiiaccount value="" />			<psnaccount value="" />			<battlenetaccount value="" />			<steamaccount value="" />			<traderating value="362" />	
				</user> """;
  final String _incorrecto = """ 
    <?xml version="1.0" encoding="utf-8"?>
      <user id="" name="" termsofuse="https://boardgamegeek.com/xmlapi/termsofuse">
			<firstname value="" />			
      <lastname value="" />			
      <avatarlink value="N/A" />			
      <yearregistered value="" />			
      <lastlogin value="" />			
      <stateorprovince value="" />			
      <country value="" />			
      <webaddress value="" />			
      <xboxaccount value="" />			
      <wiiaccount value="" />			
      <psnaccount value="" />			
      <battlenetaccount value="" />			
      <steamaccount value="" />			
      <traderating value="362" />	
			</user>""";

  Either<Problema, RegistroUsuario> obtenerRegistroUsuarioDesdeXML(
      XmlDocument documento) {
    const campoAnio = 'yearregistered';
    const campoValor = 'value';
    const campoNombre = 'firstname';
    const campoEstado = 'stateorprovince';
    const campoPais = 'country';
    const campoApellido = 'lastname';

    final anioRegistrado = obtenerValorCampo(documento, campoAnio);
    if (campoValor.isEmpty) {
      return left(UsuarioNoRegistrado());
    }
    print('hasta aqui funciona la fecha');
    String nombre = obtenerValorCampo(documento, campoNombre);
    print('hasta aqui funciona el nombre');
    String pais = obtenerValorCampo(documento, campoPais);
    print('hasta aqui funciona el pais');
    String estado = obtenerValorCampo(documento, campoEstado);
    print('hasta aqui funciona el estado');
    String apellido = obtenerValorCampo(documento, campoApellido);
    print('hasta aqui funciona el apellido');
    return right(RegistroUsuario.constructor(
        propuestaAnio: anioRegistrado,
        propuestaApellido: apellido,
        propuestaEstado: estado,
        propuestaNombre: nombre,
        propuestaPais: pais)); //RegistroUsuario.constructor //
  }

  String obtenerValorCampo(XmlDocument documento, String campo) {
    const campoValor = 'value';
    return documento.findAllElements(campo).first.getAttribute(campoValor) ??
        '';
  }

  @override
  Either<Problema, RegistroUsuario> obtenerRegistroUsuario(NickFormado nick) {
    if (nick.valor == 'benthor') {
      final documento = XmlDocument.parse(_benthor);
      return obtenerRegistroUsuarioDesdeXML(documento);
    }
    if (nick.valor == 'amlo') {
      final documento = XmlDocument.parse(_amlo);
      return obtenerRegistroUsuarioDesdeXML(documento);
    }
    if (nick.valor == 'incorrecto') {
      final documento = XmlDocument.parse(_incorrecto);
      return obtenerRegistroUsuarioDesdeXML(documento);
    }
    return left(UsuarioNoRegistrado());
  }
}
