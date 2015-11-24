<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */


?>
<div >
<?php 
   
    

?>
</div>


<h1>Asociar Nomina Con Cargo de Sindicato</h1>
<?php 
//$rawData1 = Yii::app()->db->createCommand("SELECT cedula FROM nomina WHERE cod_convencion='".$_GET['convencion']."'")->queryAll();
//$rawData2 = Yii::app()->db->createCommand('SELECT id as id_tipo, nombre_cargo FROM tipo_sindicato')->queryAll();

//$rawData = array_merge($rawData1, $rawData2);

echo CHtml::hiddenField('convencion_nomina' , $_GET['convencion'], array('id' => 'oculto_convencion'));
?>
<?php /*$dataProvider= new CActiveDataProvider($rawData,array(
    
    'pagination'=>array(
                        'pageSize'=>20000,
                        ),
     

    )
    );*/

            $this->widget('zii.widgets.grid.CGridView', array(
            'dataProvider'=>$dataProvider,
            
            //'dataProvider'=>$dataProvider_cargos,
            'id'=>'show-list',
            
              
                
            'columns'=>array(
                
             array(
            'header'=>'Nro.',
            'value'=>'$this->grid->dataProvider->pagination->currentPage * $this->grid->dataProvider->pagination->pageSize + ($row+1)',
        ),
                
                
            array('name'=>'cedula','value'=>'$data->cedula',//'$data["cedula"]', //print_r($dataProvider),// * $dataProvider->pagination->pageSize + ($contador+1),
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
            ), 
          
          
        array(  
                'class' => 'CCheckBoxColumn',
                'name' => 'id',
                'id' => 'id',
                'value' => '',
                'checked'=> '$data->getUserLevel($data->id,1,$data->cod_convencion)',
                'class' => 'CCheckBoxColumn',
                'selectableRows' => '2',
                'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
                'headerTemplate'=>'Trabajadores Beneficiados<br>{item}',
                'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
            ),
        array(
                 'name'=>'id1',
                //'value'=>'CHtml::checkBox("trabajadores_afiliados_sindicato[]",null,array("value"=>$data->trabajadores_afiliados_sindicato,"trabajadores_afiliados_sindicato"=>"trabajadores_afiliados_sindicato".$data->trabajadores_afiliados_sindicato))',
                //'name' => 'trabajadores_afiliados_sindicato',
                'id' => 'id1',
                'value' => '',//$valor->id,
                'class' => 'CCheckBoxColumn',
                'checked'=> '$data->getUserLevel($data->id,2,$data->cod_convencion)',
                'selectableRows' => '2',
                'headerTemplate'=>'Trabajadores Sindicato<br>{item}',
                'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
             'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
 
            ),
        array(
        //'name'=>'secretario_general','value'=>'CHtml::checkBox("secretario_general[]",null,array("value"=>$data->secretario_general,"$data->trabajador"=>"secretario_general".$data->secretario_general))',
        'name'=>'id2', 
        'id' => 'id2',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'checked'=> '$data->getUserLevel($data->id,3,$data->cod_convencion)',
        'headerTemplate'=>'Secretario General{item}',
        'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
                
        array(
       //'name'=>'secretario_ejecutivo','value'=>'CHtml::checkBox("secretario_ejecutivo[]",null,array("value"=>$data->secretario_ejecutivo,"secretario_ejecutivo"=>"secretario_ejecutivo".$data->secretario_ejecutivo))',
        'name' => 'id3',
        'id' => 'id3',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
       'checked'=> '$data->getUserLevel($data->id,4,$data->cod_convencion)',
        'headerTemplate'=>'Secretario Ejecutivo{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        //'name'=>'secretario_tesorero','value'=>'CHtml::checkBox("secretario_tesorero[]",null,array("value"=>$data->secretario_tesorero,"secretario_tesorero"=>"secretario_tesorero".$data->secretario_tesorero))',
        'name'=>'id4',
        'id' => 'id4',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
       'checked'=> '$data->getUserLevel($data->id,5,$data->cod_convencion)',
        'headerTemplate'=>'Secretario tesorero{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
         array(
        //'name'=>'secretario_finanzas','value'=>'CHtml::checkBox("secretario_finanzas[]",null,array("value"=>$data->secretario_finanzas,"secretario_finanzas"=>"secretario_finanzas".$data->secretario_finanzas))',
        'name'=>'id5',
        'id' => 'id5',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
       'checked'=> '$data->getUserLevel($data->id,6,$data->cod_convencion)',
        'value'=>'',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Finanzas{item}',
             'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        //'name'=>'secretario_trabajo_reclamos','value'=>'CHtml::checkBox("secretario_trabajo_reclamos[]",null,array("value"=>$data->secretario_trabajo_reclamos,"secretario_trabajo_reclamos"=>"secretario_trabajo_reclamos".$data->secretario_trabajo_reclamos))',
        'name'=>'id6',
        'id' => 'id6',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'checked'=> '$data->getUserLevel($data->id,7,$data->cod_convencion)',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Trabajo{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
                
        array(
        //'name'=>'secretario_cultura_deporte','value'=>'CHtml::checkBox("secretario_cultura_deporte[]",null,array("value"=>$data->secretario_cultura_deporte,"secretario_cultura_deporte"=>"secretario_cultura_deporte".$data->secretario_cultura_deporte))',
        'name'=>'id7',
        'id' => 'id7',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'checked'=> '$data->getUserLevel($data->id,8,$data->cod_convencion)',
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Deporte{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        
        
        array(
        //'name'=>'secretario_organizacion','value'=>'CHtml::checkBox("secretario_organizacion[]",null,array("value"=>$data->secretario_organizacion,"secretario_organizacion"=>"secretario_organizacion".$data->secretario_organizacion))',
        'name'=>'id8',
        'id' => 'id8',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'checked'=> '$data->getUserLevel($data->id,9,$data->cod_convencion)',
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Organizacion{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        //'name'=>'secretario_actas_correspondencias','value'=>'CHtml::checkBox("secretario_actas_correspondencias[]",null,array("value"=>$data->secretario_actas_correspondencias,"secretario_actas_correspondencias"=>"secretario_actas_correspondencias".$data->secretario_actas_correspondencias))',
        'name'=>'id9',
        'id' => 'id9',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
         'checked'=> '$data->getUserLevel($data->id,10,$data->cod_convencion)',  
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Actas Y Correspondencias{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
            
        ),
                
        
        array(
        //'name'=>'secretario_salud_laboral','value'=>'CHtml::checkBox("secretario_salud_laboral[]",null,array("value"=>$data->secretario_salud_laboral,"secretario_salud_laboral"=>"secretario_salud_laboral".$data->secretario_salud_laboral))',
        'name'=>'id10',
         'id' => 'id10',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'checked'=> '$data->getUserLevel($data->id,11,$data->cod_convencion)',  
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Salud Laboral{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        //'name'=>'secretario_vigilancia_disciplina','value'=>'CHtml::checkBox("secretario_vigilancia_disciplina[]",null,array("value"=>$data->secretario_vigilancia_disciplina,"secretario_vigilancia_disciplina"=>"secretario_vigilancia_disciplina".$data->secretario_vigilancia_disciplina))',
        'name'=>'id11',
        'id' => 'id11',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
         'checked'=> '$data->getUserLevel($data->id,12,$data->cod_convencion)',  
        'selectableRows' => '1',
        'headerTemplate'=>'Secretario Vigilancia y Disciplina{item}',
        'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
           
           
        ),
        array(
        //'name'=>'secretario_otro','value'=>'CHtml::checkBox("secretario_otro[]",null,array("value"=>$data->secretario_otro,"secretario_otro"=>"secretario_otro".$data->secretario_otro))',
        'name'=>'id12',
        'id' => 'id12',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'class' => 'CCheckBoxColumn',
        'selectableRows' => '1',
         'checked'=> '$data->getUserLevel($data->id,13,$data->cod_convencion)',  
        'headerTemplate'=>'Secretario Otro{item}',
            'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        ),
        array(
        //'name'=>'delegado_sindical','value'=>'CHtml::checkBox("delegado_sindical[]",null,array("value"=>$data->delegado_sindical,"delegado_sindical"=>"delegado_sindical".$data->delegado_sindical))',
        'name'=>'id13',
        'id' => 'id13',
        'htmlOptions'=>array('width'=>2, 'style'=>'text-align: center;'),
        'headerHtmlOptions'=>array('style'=>'text-align: center; vertical-align: top;'),
        'class' => 'CCheckBoxColumn',
         'checked'=> '$data->getUserLevel($data->id,14,$data->cod_convencion)',  
        'selectableRows' => '1',
        'headerTemplate'=>'Delegado Sindical{item}',
        ),
        
        
        

        //array(  // muestra una columna con los botones "view", "update" y "delete"
        //    'class'=>'CButtonColumn',
        //),
        
        
    ),
                'htmlOptions'=>array(
      'style'=>'overflow-y:scroll;height:500px; '),
 ));
           
          
 ?>
<div>
<?php

$options = array ('1' => 'Agregar', '0'=>'Quitar');
    echo '  <span>Acción:<span>'.CHtml::dropDownList('newStatus', 0,($options));
 
    echo CHtml::ajaxLink("<br>Cambiar", $this->createUrl('nomina/getvalue'), array(
        "type" => "post",
        "data" => 'js:{theIds : $.fn.yiiGridView.getChecked("show-list","id").toString(),"status":$("#newStatus").val(),
                   theIds1 : $.fn.yiiGridView.getChecked("show-list","id1").toString(),"status":$("#newStatus").val(),
                   theIds2 : $.fn.yiiGridView.getChecked("show-list","id2").toString(),"status":$("#newStatus").val(),
                   theIds3 : $.fn.yiiGridView.getChecked("show-list","id3").toString(),"status":$("#newStatus").val(),
                   theIds4 : $.fn.yiiGridView.getChecked("show-list","id4").toString(),"status":$("#newStatus").val(),
                   theIds5 : $.fn.yiiGridView.getChecked("show-list","id5").toString(),"status":$("#newStatus").val(),
                   theIds6 : $.fn.yiiGridView.getChecked("show-list","id6").toString(),"status":$("#newStatus").val(),
                   theIds7 : $.fn.yiiGridView.getChecked("show-list","id7").toString(),"status":$("#newStatus").val(),
                   theIds8 : $.fn.yiiGridView.getChecked("show-list","id8").toString(),"status":$("#newStatus").val(),
                   theIds9 : $.fn.yiiGridView.getChecked("show-list","id9").toString(),"status":$("#newStatus").val(),
                   theIds10 : $.fn.yiiGridView.getChecked("show-list","id10").toString(),"status":$("#newStatus").val(),
                   theIds11 : $.fn.yiiGridView.getChecked("show-list","id11").toString(),"status":$("#newStatus").val(),
                   theIds12 : $.fn.yiiGridView.getChecked("show-list","id12").toString(),"status":$("#newStatus").val(),
                   theIds13 : $.fn.yiiGridView.getChecked("show-list","id13").toString(),"status":$("#newStatus").val(),
                   convencion : $("#oculto_convencion").val()
                   }',
        
        
             
        //"data" => 'js:{theIds1 : $.fn.yiiGridView.getChecked("show-list","id1").toString(),"status":$("#newStatus").val()}',
        "success" => 'js:alert("Cambios Realizados") ','js:document.location.reload()'//array(
        //'class' => 'btn btn-info'
        )
        );

?>

</div>
<?php //echo $this->renderPartial('_form', array('model'=>$model)); ?>
<?php //echo CHtml::endForm(); ?>