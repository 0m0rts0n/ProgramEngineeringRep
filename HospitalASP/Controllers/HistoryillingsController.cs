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
    public class HistoryillingsController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: Historyillings
        public ActionResult Index()
        {
            var historyillings = db.Historyillings.Include(h => h.Analyze).Include(h => h.Illing);
            return View(historyillings.ToList());
        }

        // GET: Historyillings/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Historyilling historyilling = db.Historyillings.Find(id);
            if (historyilling == null)
            {
                return HttpNotFound();
            }
            return View(historyilling);
        }

        // GET: Historyillings/Create
        public ActionResult Create()
        {
            ViewBag.AnalysisID = new SelectList(db.Analyzes, "AnalysisID", "AnalysisType");
            ViewBag.IllingID = new SelectList(db.Illings, "IllingID", "IllingName");
            return View();
        }

        // POST: Historyillings/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HistoryillingID,IllingID,AnalysisID,AnalysisResult,DatePatientilling,PatientCondition")] Historyilling historyilling)
        {
            if (ModelState.IsValid)
            {
                historyilling.HistoryillingID = Guid.NewGuid();
                db.Historyillings.Add(historyilling);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AnalysisID = new SelectList(db.Analyzes, "AnalysisID", "AnalysisType", historyilling.AnalysisID);
            ViewBag.IllingID = new SelectList(db.Illings, "IllingID", "IllingName", historyilling.IllingID);
            return View(historyilling);
        }

        // GET: Historyillings/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Historyilling historyilling = db.Historyillings.Find(id);
            if (historyilling == null)
            {
                return HttpNotFound();
            }
            ViewBag.AnalysisID = new SelectList(db.Analyzes, "AnalysisID", "AnalysisType", historyilling.AnalysisID);
            ViewBag.IllingID = new SelectList(db.Illings, "IllingID", "IllingName", historyilling.IllingID);
            return View(historyilling);
        }

        // POST: Historyillings/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HistoryillingID,IllingID,AnalysisID,AnalysisResult,DatePatientilling,PatientCondition")] Historyilling historyilling)
        {
            if (ModelState.IsValid)
            {
                db.Entry(historyilling).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AnalysisID = new SelectList(db.Analyzes, "AnalysisID", "AnalysisType", historyilling.AnalysisID);
            ViewBag.IllingID = new SelectList(db.Illings, "IllingID", "IllingName", historyilling.IllingID);
            return View(historyilling);
        }

        // GET: Historyillings/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Historyilling historyilling = db.Historyillings.Find(id);
            if (historyilling == null)
            {
                return HttpNotFound();
            }
            return View(historyilling);
        }

        // POST: Historyillings/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Historyilling historyilling = db.Historyillings.Find(id);
            db.Historyillings.Remove(historyilling);
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
