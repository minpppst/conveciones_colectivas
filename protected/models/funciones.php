<?php
class funciones {

        // Método estático para no tener que crear una instancia
        
        
public static function llenar_check($caso,$ids,$accion){
            
            if($caso==1){
               $columna="trabajadores_amparados_conve_col";
            }
            if($caso==2){
               $columna="trabajadores_afiliados_sindicato";
            }
            if($caso==3){
               $columna="secretario_general";
            }
            if($caso==4){
               $columna="secretario_ejecutivo";
            }
            if($caso==5){
               $columna="secretario_tesorero";
            }
            if($caso==6){
               $columna="secretario_finanzas";
            }
            if($caso==7){
               $columna="secretario_trabajo_reclamos";
            }
            if($caso==8){
               $columna="secretario_cultura_deporte";
            }
            if($caso==9){
               $columna="secretario_organizacion";
            }
            if($caso==10){
               $columna="secretario_actas_correspondencias";
            }
            if($caso==11){
               $columna="secretario_salud_laboral";
            }
            if($caso==12){
               $columna="secretario_vigilancia_disciplina";
            }
            if($caso==13){
               $columna="secretario_otro";
            }
            if($caso==14){
               $columna="delegado_sindical";
            }
            $ii=1;
            $iii=0;
            for($i=0;$i<count($ids);$i=$i+2){
            $nomina[$iii]=$ids[$iii];
            $cedula[$ii]=$ids[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $ii=1;
       $iii=0;
       $id_trabajador;
       try{
                   $transaction = Yii::app()->db->beginTransaction();
       for($i=0;$i<count($nomina);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina[$iii]."' and trabajador='".$cedula[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set ".$columna." = ".$accion." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        $id_trabajador=$resultado_sql['id'];
        }
        }
                        
                       
                       $nombre_usuario=Yii::app()->user->Name;
                       $userid=       Yii::app()->user->id;
         Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                                  values ('User ".$nombre_usuario. " update trabajador columna ". $columna."','UPDATE', 'trabajador_nomina','".$id_trabajador."',now(),'".$userid."')")->execute();
        $transaction->commit();
        
       }catch(CDbException $error){
                    
                    $transaction->rollback();
                  //  echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos.</div>"; //for ajax
                   echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos. Error:".$error."</div>"; //for ajax
                   }                    
        
        
         return 1; 
        }
        
}


?>