using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HospitalASP;

namespace HospitalASP.Controllers
{
    public class PatientCardsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: PatientCards
        public ActionResult Index()
        {
            var patientCards = db.PatientCards.Include(p => p.Historyilling);
            return View(patientCards.ToList());
        }

        // GET: PatientCards/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientCard patientCard = db.PatientCards.Find(id);
            if (patientCard == null)
            {
                return HttpNotFound();
            }
            return View(patientCard);
        }

        // GET: PatientCards/Create
        public ActionResult Create()
        {
            ViewBag.HistoryillingID = new SelectList(db.Historyillings, "HistoryillingID", "AnalysisResult");
            return View();
        }

        // POST: PatientCards/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PatientCardNum,CardCreatingDate,CardOwnerFIO,HistoryillingID")] PatientCard patientCard)
        {
            if (ModelState.IsValid)
            {
                patientCard.PatientCardNum = Guid.NewGuid();
                db.PatientCards.Add(patientCard);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.HistoryillingID = new SelectList(db.Historyillings, "HistoryillingID", "AnalysisResult", patientCard.HistoryillingID);
            return View(patientCard);
        }

        // GET: PatientCards/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientCard patientCard = db.PatientCards.Find(id);
            if (patientCard == null)
            {
                return HttpNotFound();
            }
            ViewBag.HistoryillingID = new SelectList(db.Historyillings, "HistoryillingID", "AnalysisResult", patientCard.HistoryillingID);
            return View(patientCard);
        }

        // POST: PatientCards/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PatientCardNum,CardCreatingDate,CardOwnerFIO,HistoryillingID")] PatientCard patientCard)
        {
            if (ModelState.IsValid)
            {
                db.Entry(patientCard).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.HistoryillingID = new SelectList(db.Historyillings, "HistoryillingID", "AnalysisResult", patientCard.HistoryillingID);
            return View(patientCard);
        }

        // GET: PatientCards/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PatientCard patientCard = db.PatientCards.Find(id);
            if (patientCard == null)
            {
                return HttpNotFound();
            }
            return View(patientCard);
        }

        // POST: PatientCards/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            PatientCard patientCard = db.PatientCards.Find(id);
            db.PatientCards.Remove(patientCard);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
