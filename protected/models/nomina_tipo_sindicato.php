<?php

/**
 * This is the model class for table "nomina_tipo_sindicato".
 *
 * The followings are the available columns in table 'nomina_tipo_sindicato':
 * @property string $id
 * @property string $tipo_sindicato
 * @property string $id_nomina
 * @property string $cod_convencion_nomina
 *
 * The followings are the available model relations:
 * @property Nomina $codConvencionNomina
 * @property TipoSindicato $tipoSindicato
 * @property Nomina $idNomina
 */
class nomina_tipo_sindicato extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return nomina_tipo_sindicato the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'nomina_tipo_sindicato';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tipo_sindicato, id_nomina, cod_convencion_nomina', 'required'),
			array('tipo_sindicato, id_nomina, cod_convencion_nomina', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, tipo_sindicato, id_nomina, cod_convencion_nomina', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'codConvencionNomina' => array(self::BELONGS_TO, 'Nomina', 'cod_convencion_nomina'),
			'tipoSindicato' => array(self::BELONGS_TO, 'TipoSindicato', 'tipo_sindicato'),
			'idNomina' => array(self::BELONGS_TO, 'Nomina', 'id_nomina'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'tipo_sindicato' => 'Tipo Sindicato',
			'id_nomina' => 'Id Nomina',
			'cod_convencion_nomina' => 'Cod Convencion Nomina',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('tipo_sindicato',$this->tipo_sindicato,true);
		$criteria->compare('id_nomina',$this->id_nomina,true);
		$criteria->compare('cod_convencion_nomina',$this->cod_convencion_nomina,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}